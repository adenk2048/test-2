#include<iostream>
#include<cstdio>
#include<fstream>
#include<cassert>
#include<random>
#include<utility>
//#include <iostream>
#include<sstream>
#include<string>
#include<algorithm>
#include<utility>
#include<vector>

using std::string;
using std::vector;
using std::cin;
using std::cout;
using std::endl;
using std::pair;



vector<pair<double,double>> trendTypes = {{0,0.1},{0,5},{6,8},{9,12},{-5,0},{-5,-3},{-12,-9},{-20,-15}};
vector<pair<int,int>> groups = { {1,24}, {1,8}, {8,16}, {16,24}, {21,24}};
namespace rng
{
    std::random_device rd;
    std::mt19937 gen;

    void setSeed(uint32_t seed)
    {
        gen=std::mt19937(seed);
    }

    double random(double l,double r)
    {
        if (l > r){ std::swap(l,r);}
        std::uniform_real_distribution<>tmp(l,r);
        return tmp(gen);
    }

    double random()
    {
        return random(0,1);
    }
}

using rng::setSeed;
using rng::random;

class Stock
{

public:

    struct Edge{
        Stock* to;
        int l,r;
    };
    vector<Edge>adj;

    string name;
    double price;
    double trend; //trend(going up or down)
    double stability; //small "peaks"

    //bounding the price into certain range
    double max;
    double min;
    double maxBound;
    double minBound;


    Stock(string name, double price, double trend, double stability, double max, double min, double maxBound, double minBound)
    {
        this->name = name;
        this->price = price;
        this->trend = trend;
        this->stability = stability;
        this->max = max;
        this->min = min;
        this->maxBound = maxBound;
        this->minBound = minBound;
    }

    void update()
    {
        double newPrice=price;
        double d1   = max - maxBound;
        double d2 = minBound - min;

        newPrice+=random()*trend;
        
        if(price>=max)
        {
            trend=trend*random(0.2,0.4)-random(0.3,0.5);
        }
        if(price<=min)
        {
            trend=trend*random(0.2,0.4)+random(0.3,0.5);
        }

        if (d1 != 0 && (price >= max || (price > maxBound && random() < (price - maxBound) / d1))){
        newPrice -= std::min(1.0,(price - maxBound) / d1) * random() * (price-maxBound);
        // printf("d1: %lf|%lf||||delta: %lf ",d1,(price - maxBound),-(price - maxBound) / d1 * random() * trend);
        }
        else if (d2 != 0 && (price <= min || (price < minBound && random() < (minBound - price) / d2))){
        newPrice += std::min(1.0,(minBound - price) / d2) * random() * (minBound-price);
        // printf("d2: %lf|%lf||||delta: %lf ",d2,(minBound - price),(minBound - price) / d2 * random() * trend);
        }


        newPrice+=random(-1,1)*stability;


        //update neighbors
        double delta = std::min(newPrice - price,5.0);
        groupAdd(delta);
        price=newPrice;
    }

    string getName()
    {
        return name;
    }
    
    double getPrice()
    {
        return price;
    }
    
    double getTrend()
    {
        return trend;
    }

    void addTrend(double delta)
    {
        trend+=delta;
    }
    void addBounds(double dMax, double dMin, double dMaxBound, double dMinBound){
        max += dMax;
        maxBound += dMaxBound;

        if (min + dMin > 0) min += dMin;
        if (minBound + dMinBound > 0) minBound += dMinBound;
    }

    void pushRelation(Stock* to,int l,int r)
    {
        adj.push_back({to,l,r});
    }
    
    void groupAdd(double delta)
    {
        for (Edge i : adj){
            double c2 = ((double) random(i.l, i.r) /5000.0) * delta;
            i.to->price += c2;
        }
    }

};


enum operationType{singleModify, groupModify, newsEvent};

class EventOperation
{
private:
    struct Operation
    {
        operationType type;
        int param1;
    };
    Operation opt;
    string eventName;
    Stock *target;
    
public:

    EventOperation(Stock *target,operationType type,string eventName,int param1)
    {
        this->target=target;
        this->eventName=eventName;
        opt={type,param1};
    }

    void announce()
    {
        switch(opt.type)
        {
            case singleModify:
                break;
            case groupModify:
                break;
            case newsEvent:
                cout<<target->getName()<<" is affected by "<<eventName<<"!!!!!!!!";
                break;
            default:
            assert(false);
        }
    }

    void operate()
    {
        switch(opt.type)
        {
            case singleModify:
                target->addTrend(opt.param1);
                break;
            case groupModify:
                target->groupAdd(opt.param1);
                break;
            case newsEvent:
                
                break;
            default:
            assert(false);
        }
        announce();
    }
};


//vector<EventOperation>timeline[1005];

string split(const string &s, char delimiter){
    string out = "";
    string to_add;

    for(char c: s){
        if (c== delimiter){
            out+= " ";
            out+= to_add;
            to_add.clear();
        }
        else{
            to_add += c;
        }
    }
    out += " ";
    out += to_add;
    return out;

}

struct Headline{
    string desc;
    int trendType;
    int impact;

    Headline(string d, int t, int i)
        : desc(d), trendType(t), impact(i){}
};

struct Event{
    string headline;
    int trendType;
    int stockPos;

    Event(string h, int t, int s)
        : headline(h), trendType(t), stockPos(s){}
    
};


double superRandom(double l, double r, int n){
    double out = 0;
    for (int i = 0; i < n; i ++){
        out += random(l,r);
    }
    return out / n;
}

double superDuperRandom(double l, double r){
    double out;
    for (int i = 0; i < 10 ; i ++){
        out = random(l,r);
    }
    return out;
}

vector<Headline> eventsList;
vector<Stock> stocks;
vector<pair<string,string>> stockNames;
vector<vector<double>> dataPoints(1000);
vector<pair<string,int>> outNews;
vector<Event> news = {};

Event generateRandomEvent(){
    string s, headline;
    int i, headlinePos, stockPos;

    while (true){
        headlinePos = (int) random(0,72);
        stockPos = (int)random(1,24);

        s = stockNames [stockPos].first;
        
        headline = eventsList[headlinePos].desc;
        i = eventsList[headlinePos].impact;

        if (groups[i].first <= stockPos && stockPos < groups[i].second){
            if (news.empty()){
                break;
            }
            else if (news.back().stockPos != stockPos){
                break;
            }
            //break;
        }
    }
    //cout << s << headline << endl;
    return Event(s+headline, eventsList[headlinePos].trendType, stockPos);
}

int industry(int stockPos){
    if (1 <= stockPos && stockPos < 8){
        return 1;
    }
    if (8 <= stockPos && stockPos < 16){
        return 2;
    }
    else return 3;
}


int main()
{   
    cin.clear();
    //input all news articles
    freopen("event_name.txt", "r", stdin);
    // while(1);
    setSeed(1234);
    int n; cin>>n; 

    string s;
    string symbol; 
    int trendType, impact;

    for (int i = 0; i < n; i ++){
        cin >> s; s = split(s,'_');
        cin >> trendType >> impact;

        Headline headline(s,trendType,impact);
        eventsList.push_back(headline);
        //cout << s << " " << trendType << " " << impact << endl;
    }

    cin.clear();

    freopen("stock_name.txt", "r", stdin);
    cin >> n; 
    for (int i = 0; i < n; i ++){
        cin >> s; s = split(s,'_');
        cin >> symbol;
        stockNames.push_back({s,symbol});
        
        double max, min, minBound, maxBound;
        double range = random(40,45);
        min = random(60,300);
        max = min + range;
        minBound = min + random(0,2);//modified
        maxBound = max - random(0,2);

        //cout << min <<" "<< minBound << " " << maxBound <<" "<< max<< endl;
        //cout << (min < minBound  && minBound < maxBound && maxBound < max) << endl;
        Stock stock(s, random(minBound,maxBound), random(-5,5),superRandom(0.5,3,5), max, min, maxBound, minBound );
        stocks.push_back(stock);
    }
    //Stock(string name, double price, double trend, double stability, double max, double min, double maxBound, double minBound)

    //create relationships
    int stockPos1, stockPos2;
    for (int i = 0;i < 250; i ++){
        int lower_bound, upper_bound;

        while (true){
            stockPos1 = (int)random(0, 23.9999);
            stockPos2 = (int)random(0, 23.9999);

            if (stockPos1 != stockPos2){
                break;
            }
        }
        for (int i = 0; i < 2; i ++){
            if (industry(stockPos1) == industry(stockPos2)){
                lower_bound = random(-600,-200);
            }
            else{
                lower_bound = random(-200,600);
            }
            upper_bound = lower_bound + random(0,200);
            if (i == 0){
                stocks[stockPos1].pushRelation(&stocks[stockPos2], lower_bound, upper_bound);
            }
            else{
                stocks[stockPos2].pushRelation(&stocks[stockPos1], lower_bound, upper_bound);
            }
        }
    }

    freopen("data.txt","w",stdout);

    news.push_back(generateRandomEvent());
    double wilmo = random(200,300);
    // stocks[0].minBound = -10000000000000;
    // stocks[0].min = -100000000000;

    for (int i = 0; i < 740; i ++){

        bool newsHappened = false;
        stocks[0].trend = random(-5,-1);

        if (random() <0.35){
            newsHappened = true;

            Event event = generateRandomEvent();
            //cout << event.headline << endl;

            double l = trendTypes[event.trendType].first;
            double r = trendTypes[event.trendType].second;

            Stock& stock = stocks[event.stockPos];
            double deltaTrend = random(l,r);
            double delta = random(1,2);//modified

            if (deltaTrend > 0){
                stock.max += delta;
                stock.maxBound +=delta;
            }
            else{
                if (stock.min > delta){
                    stock.min = stock.min - delta;
                }
                else{
                    stock.min = 2;
                }
                if (stock.minBound > delta){
                    stock.minBound = stock.minBound - delta;
                }
                else{
                    stock.minBound = 2;
                }
            }
            outNews.push_back({event.headline, i});
            
        }

        if (!newsHappened) outNews.push_back({"None", i});
        wilmo -= random(5,10);
        cout << wilmo << " ";
        //stocks[0].update();
        //cout << stocks[0].price << " ";
        for (int j = 1; j < 24;j ++){

            stocks[j].update();
            cout << stocks[j].price << " ";
        }
        cout <<  endl;
    }
    cout.clear();
    freopen("headlines.txt","w",stdout);
    
    for (pair<string,int> i : outNews){
        cout << i.first << " " << i.second <<endl;
    }

}