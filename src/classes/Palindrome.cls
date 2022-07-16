public with sharing class Palindrome {

    public Boolean isPalindrome(String toCheck){
        return toCheck.equals(toCheck.reverse());
    }

    public Boolean isPalindrome(Integer toCheck){
        return this.isPalindrome(String.valueOf(toCheck));
    }

    public Boolean isPalindromeInt(Integer toCheck) {
        Integer temp = toCheck;
        Integer reversed = 0;

        while (temp > 0) {
            Integer remainder = Math.mod(temp, 10);
            reversed += remainder;
            temp /= 10;
            if (temp !=0 ) {
                reversed =reversed+10;
            }
        }
        System.debug(reversed);

        return  reversed == toCheck;
    }
}