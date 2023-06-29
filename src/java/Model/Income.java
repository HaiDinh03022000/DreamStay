/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author hatha
 */
public class Income {
    private int ttaccounts, ttowners, ttrooms, ttmoney, ttbills, ttcus;

    public Income() {
    }

    public Income(int ttaccounts, int ttowners, int ttrooms, int ttmoney) {
        this.ttaccounts = ttaccounts;
        this.ttowners = ttowners;
        this.ttrooms = ttrooms;
        this.ttmoney = ttmoney;
    }
    

    public int getTtaccounts() {
        return ttaccounts;
    }

    public void setTtaccounts(int ttaccounts) {
        this.ttaccounts = ttaccounts;
    }

    public int getTtowners() {
        return ttowners;
    }

    public void setTtowners(int ttowners) {
        this.ttowners = ttowners;
    }

    public int getTtrooms() {
        return ttrooms;
    }

    public void setTtrooms(int ttrooms) {
        this.ttrooms = ttrooms;
    }

    public int getTtmoney() {
        return ttmoney;
    }

    public void setTtmoney(int ttmoney) {
        this.ttmoney = ttmoney;
    }

    public int getTtbills() {
        return ttbills;
    }

    public void setTtbills(int ttbills) {
        this.ttbills = ttbills;
    }

    public int getTtcus() {
        return ttcus;
    }

    public void setTtcus(int ttcus) {
        this.ttcus = ttcus;
    }

    @Override
    public String toString() {
        return "Income{" + "ttaccounts=" + ttaccounts + ", ttowners=" + ttowners + ", ttrooms=" + ttrooms + ", ttmoney=" + ttmoney + ", ttbills=" + ttbills + ", ttcus=" + ttcus + '}';
    }
    
    
    
}
