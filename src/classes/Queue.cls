/**
 * Created by Danylo on 16.07.2022.
 */

public with sharing class Queue {

    private List<Integer> integers = new List<Integer>();
    private Integer indexOfLast = -1;
    private Integer indexOfFirst = -1;  // завжди 0

    public void push(Integer value){
        integers.add(value);
        indexOfLast++;
        indexOfFirst = 0;
    }

    public void shift(){
        if(!isEmpty()){
            integers.remove(0);
            if(indexOfLast == 0){
                indexOfFirst = -1;
            }
            indexOfLast--;
        }
    }

    public Integer getFirstOfQueue(){
        if(!isEmpty()){
            return integers.get(indexOfFirst);
        }
        return null;

    }

    public Integer getLastOfQueue(){
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