/**
 * Created by Danylo on 12.07.2022.
 */

public class Fighter {
    public String name;
    public Integer health;
    public Integer damagePerAttack;

    public Fighter(String name, Integer health, Integer damagePerAttack) {
        this.name = name;
        this.health = health;
        this.damagePerAttack = damagePerAttack;
    }




    // fightFirstWay - First realisation of fight method
    public Fighter fightFirstWay(Fighter opponent){
        while ((this.health > 0) && (opponent.health > 0)) {
            // First attack
            opponent.health -= this.damagePerAttack;
            // Check if opponent live
            if(opponent.health > 0){
                // Opponent attack
                this.health -= opponent.damagePerAttack;
            }
        }
        return this.health > opponent.health ? this : opponent;
    }


    


    // fightSecondWay - Second realisation of fight method
    public Fighter fightSecondWay(Fighter opponent){
        Fighter winner = this;
        if(this.health <= 0){
            winner = opponent;
        }
        while ((this.health > 0) && (opponent.health > 0)) {
            // First attack
            opponent.health -= this.damagePerAttack;
            // Check if opponent death
            if(opponent.health <= 0){
                break;
            }
            // Opponent attack
            this.health -= opponent.damagePerAttack;
            // Check if first death
            if(this.health < 0) {
                winner = opponent;
                break;
            }

        }
        return winner;
    }


}