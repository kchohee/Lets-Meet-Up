users_list = [
    ["Bob", "bob@gmail.com", "23reu"],
    ["Hongki","ft@island.com", "rhagfsdr"],
    ["Jessice","jauf@yahoo.com","dsfg"],
    ["Amber","kehai@hotmail.com","fsdg"],
    ["Roger","bewrany@aol.com","fdsg"],
    ["Jaebum","jpark@highergang.com","rgsafsrg"],
    ["Alex","ewtkfho@icloud.com","fsgs"],
    ["Jamal","ewtk@gmail.com","dfg"],
    ["Dpr","dpr@coming2ulive.com" "rwgdar"],
    ["Nelson","wtfwr@hotmail.com","rgfs"],
    ["Matt","rwtgfwret@msn.com","gfsg"],
    ["Leon","leonjkkim0401@gmail.com","jiyongie"],
    ["G-dragon","gd@bigbang.com", "rwgrasdg"],
    ["Paul","paulm@gmail.com","jiyongie"],
    ["Janice","rgfobiwebriu@aol.com","rtgfs"],
    ["Will","ban@yas.com","ban"],
    ["Dai","ibgrsfvciub@hotmail.com","egrf"],
    ["Soohyun", "sohyun@naver.com", "regag"]
]
@all_users = []
users_list.each do |name, email, password|
   @all_users << User.create(name: name, email: email, password: password)
end

groups_list = [
    ["Parents form", "We give each other advice on issue that we might be having with our children"],
    ["Coders-Around the world","We help each other strengthen our coding abilities"],
    ["We hate cats","I guess its not that we hate it... we are just allergic and rather stay away. Share your feline horros stories.We all know that they are really out to get us.... one day they will take over the world if we aren't careful"],
    ["Weeb Life","ARe you about that weeb life? Need some cosplay ideas? Maybe you are stuck on how to make something pratical for wearing... WE ARE HERE TO HELP!"],
    ["We aren't crazy...","The goverment is hiding secrets!!! From UFO's to the berunda triangle.. they have their dirty fingers in EVERYTHING!!! Join us in the fight against the unknown. You will have to provide your own tin-foil hat. No lizard people allowed! "],
    ["Foodies","We are dedicated to sharing recipes, the go to food spots, and advice to improve your instagram foodies photos!"],
    ["Memes","Do you know dey way?"]
]
@all_groups = []
groups_list.each do |name, bio|
    @all_groups << Group.create(name: name, bio: bio)
end

@all_users.each do |user|
   @group = @all_groups[rand 7]
   user.group = @group
   user.save
end