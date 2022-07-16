/**
 * Created by Danylo on 15.07.2022.
 */

public with sharing class Stack {

    private List<Integer> integers = new List<Integer>();
    private Integer indexOfLast = -1;

    public void push(Integer value){
        integers.add(value);
        indexOfLast++;
    }

    public void pop(){
        if(!isEmpty()){
            integers.remove(indexOfLast);
            indexOfLast--;
        }
    }

    public Integer peek(){
        if(!isEmpty()){
            return integers.get(indexOfLast);
        }
        return null;
    }

    public Integer size(){
        return indexOfLast+1;
    }

    public Boolean isEmpty(){
        return indexOfLast == -1;
    }

    public void showAllStack(){
        for(Integer i : integers){
            System.debug(i);
        }
    }


}