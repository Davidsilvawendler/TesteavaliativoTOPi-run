trigger Account on account (before insert, before update, after insert, after update) {

    newAccountTH().run();
    
}