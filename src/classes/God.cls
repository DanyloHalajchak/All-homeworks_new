/**
 * Created by Danylo on 07.07.2022.
 */

public with sharing class God {

    public Man createMan(String name) {
        return new Man(name);
    }

    public Woman createWomen(String name){
        return new Woman(name);
    }

}