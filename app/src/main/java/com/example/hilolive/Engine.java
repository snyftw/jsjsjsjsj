package com.example.hilolive;
import java.util.*;
public final class Engine {
 public static final String[] R={"A","2","3","4","5","6","7","8","9","10","J","Q","K"};
 public static int rank(String s){ if(s==null)return -1; s=s.trim().toUpperCase(Locale.US); for(int i=0;i<13;i++)if(R[i].equals(s))return i;return -1; }
 public static double probability(int r,boolean higher){if(r<0||r>12)return Double.NaN;return higher?(r==0?12:13-r)/13.0:(r==12?12:r+1)/13.0;}
 public static double ev(double p,double totalMultiplier,double currentMultiplier){return p*totalMultiplier/currentMultiplier-1;}
 public static String analysis(int r,double higherTotal,double lowerTotal,double currentTotal){if(r<0)return "Card not detected — verify manually";double ph=probability(r,true),pl=probability(r,false);if(currentTotal<=0||higherTotal<=0||lowerTotal<=0)return "Enter positive multipliers";double eh=ev(ph,higherTotal,currentTotal),el=ev(pl,lowerTotal,currentTotal);return String.format(Locale.US,"Card %s | Higher/same %.2f%% | Lower/same %.2f%%\nEV Higher %+.2f%% | EV Lower %+.2f%%\nCashout: 0%% additional EV | Best directional EV: %+.2f%%\n%s",R[r],100*ph,100*pl,100*eh,100*el,100*Math.max(eh,el),Math.max(eh,el)<0?"Both predictions have negative one-step EV versus cashout.":"Check live payouts and rules before interpreting EV.");}
}
