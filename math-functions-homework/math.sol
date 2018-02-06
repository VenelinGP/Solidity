pragma solidity ^0.4.19;

contract Math {
    
    int256 a;
    
    
    function Math () public{
        a = 0;
    }
    
    function add(int256 _b) public returns (int256){
        return a+=_b;
    }
    
    function substract(int256 _b) public returns(int256){
        return a-=_b;
    }
    
     function multiply(int256 _b) public returns(int256){
        return a*=_b;
    }
    
     function divide(int256 _b) public returns(int256){
         if ( _b != 0 ){
            return a/=_b;
         } else {
             return a;
         }
    }
    
    function power(int256 _b) public returns(int256){
        int256 result = 1;
        for(uint256 i = 0; i < uint256 (_b); i++){
            result = result * a;
        }
        a = result;
        result = 1;
        return a;
    }
    
    function reminder(int256 _b) public returns(int256){
        
        if(_b != 0){
            return a %= _b;
        } else {
            return a;
        }
    }
    
    function getFirstNUmber() public view returns (int256){
        return a;
    }
    
    function resetFirstNumnber() public returns (int256){
        a = 0;
        return a;
    }
}