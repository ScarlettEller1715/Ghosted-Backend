class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/profiles" do
    profiles = Profile.all.shuffle 
    profiles.to_json
  end

  get "/likes" do
    likes = Like.all
    likes.to_json
  end

  get "/user" do 
    user = User.all[0]
    user.to_json
  end

  get "/matches" do
    match_array = Like.matching_profiles
    matches = match_array.collect do |match|
      match.profile
    end
    matches.to_json
  end

  get "/unswiped_profiles" do
    unique_profiles = Profile.unswiped_profiles.shuffle
    unique_profiles.to_json
  end

  get "/profile/:id" do
    target = Profile.find(params[:id])
    target.to_json
  end

  post "/like" do
    user = User.find(params[:user_id])
    profile = Profile.find(params[:profile_id])
    target_like = Like.find_by(profile_id: params[:profile_id])

    Like.like_function(user, profile)

    if target_like != nil
      if target_like.profile_like == true
        response = true
        response.to_json
      else 
        response = false
        response.to_json
      end
    else
      response = false
      response.to_json
    end

  end

  post "/dislike" do
    user = User.find(params[:user_id])
    profile = Profile.find(params[:profile_id])

    Like.dislike_function(user, profile)
  end

  patch "/undo" do
    user = User.find(params[:user_id])
    profile = Profile.find(params[:profile_id])

    Like.undo_function(user, profile)
  end

  patch "/unmatch" do
    user = User.find(params[:user_id])
    profile = Profile.find(params[:profile_id])

    Like.unmatch(user, profile)
  end

  patch "/reset" do
    Like.destroy_all
    Profile.destroy_all
    User.destroy_all

  u1 = User.create(name: "Jonathan", pronouns: "he/him/his", age: 1, description: "Ask me about my icebreakers", location: "New York, NY", image: "https://media-exp1.licdn.com/dms/image/C4E03AQFar5W8R6vTFw/profile-displayphoto-shrink_800_800/0/1602806523478?e=1652313600&v=beta&t=0nqDOqDwQ8ql6cOTYx6gLlQJwdGABiTCx2gQL_DB8wc")

  p1 = Profile.create(name: "Abe", pronouns: "he/they/theirs", age: 156, description: "Live theatre blows my mind! Take me out to a show?", location: "Springfield", image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/Abraham_Lincoln_O-77_matte_collodion_print.jpg", swipe_status: false)
  p2 = Profile.create(name: "Anne", pronouns: "she/her/hers", age: 485, description: "So no head?", location: "London, England", image: "https://upload.wikimedia.org/wikipedia/commons/0/03/AnneBoleynHever.jpg", swipe_status: false)
  p3 = Profile.create(name: "Ben", pronouns: "he/him/his", age: 233, description: "Inventor | Writer | Entrepreneur | West Philadelphia born and raised", location: "Philadelphia, PA", image: "https://upload.wikimedia.org/wikipedia/commons/8/87/Joseph_Siffrein_Duplessis_-_Benjamin_Franklin_-_Google_Art_Project.jpg", swipe_status: true)
  p4 = Profile.create(name: "Elizabeth", pronouns: "she/her/hers", age: 407, description: "Beauty fanatic, love a good bath bomb.", location: "Budapest, Hungary", image: "https://upload.wikimedia.org/wikipedia/commons/7/73/Elizabeth_Bathory_Portrait.jpg", swipe_status: false)
  p5 = Profile.create(name: "Lizzie", pronouns: "she/her/hers", age: 94, description: "Can I axe you a question? Jk lol, I don't do that anymore.", location: "Fall River, MA", image: "https://upload.wikimedia.org/wikipedia/commons/b/b5/Lizzie_borden.jpg", swipe_status: false)
  p6 = Profile.create(name: "Walt", pronouns: "he/him/his", age: 55, description: "Theme park date?", location: "Orlando, FL", image: "https://upload.wikimedia.org/wikipedia/commons/d/df/Walt_Disney_1946.JPG", swipe_status: false)
  p7 = Profile.create(name: "Julius", pronouns: "he/him/his", age: 2062, description: "It's about drive, it's about power, we stay hungry, we devour!", location: "Rome, Italy", image: "https://cdn-cdaac.nitrocdn.com/tFOqLIaMYIaFjSGNUoYXbEDiJHtqbEtH/assets/static/optimized/rev-7fdb227/wp-content/uploads/2014/12/830px-Ca%CC%88sar.jpg", swipe_status: false)
  p8 = Profile.create(name: "Genghis", pronouns: "he/him/his", age: 794, description: "Travel enthusiast, horse guy", location: "Ulaanbaatar, Mongolia", image: "https://upload.wikimedia.org/wikipedia/commons/3/35/YuanEmperorAlbumGenghisPortrait.jpg", swipe_status: false)
  p9 = Profile.create(name: "Public Universal Friend", pronouns: "they/them/theirs", age: 202, description: "Will steal your hoodie, not sorry.", location: "Cumberland, RI", image: "https://upload.wikimedia.org/wikipedia/commons/6/6a/Public_Universal_Friend_portrait.jpg", swipe_status: false)
  p10 = Profile.create(name: "Socrates", pronouns: "?/?/?", age: 2416, description: "Gadfly of Athens, practicing atheist, ENTP", location: "Athens, Greece", image: "https://miro.medium.com/max/1400/1*KA4UFJLWvbqJXnFk-CcDWg.jpeg", swipe_status: true)
  p11 = Profile.create(name: "Vlad", pronouns: "he/him/his", age: 559, description: "Accept no substitutes", location: "Ambras Castle, Romania", image: "https://upload.wikimedia.org/wikipedia/commons/a/af/Vlad_Tepes_002.jpg", swipe_status: false)
  p12 = Profile.create(name: "Audrey", pronouns: "she/her/hers", age: 28, description: "Breakfast date?", location: "Hollywood, CA", image: "https://upload.wikimedia.org/wikipedia/commons/5/5e/Audrey_Hepburn_1956.jpg", swipe_status: false)
  p13 = Profile.create(name: "Katharine", pronouns: "she/her/hers", age: 18, description: "Shoot for the moon, you might just land a star.", location: "Hollywood, CA", image: "https://upload.wikimedia.org/wikipedia/commons/0/08/Katharine_Hepburn_promo_pic.jpg", swipe_status: false)
  p14 = Profile.create(name: "Cixi", pronouns: "she/her/hers", age: 113, description: "gaslight, gatekeep, girlboss", location: "Beijing, China", image: "https://upload.wikimedia.org/wikipedia/commons/2/23/Hubert_Vos%27s_painting_of_the_Dowager_Empress_Cixi_%28Tzu_Hsi%29.jpg", swipe_status: false)
  p15 = Profile.create(name: "Shikibu", pronouns: "she/they/theirs", age: 990, description: "Unapolagetic fanfic writer", location: "Kyoto, Japan", image: "https://upload.wikimedia.org/wikipedia/commons/1/14/Murasaki_Shikibu_Komatsuken.png", swipe_status: false)
  p16 = Profile.create(name: "Mary", pronouns: "she/they/theirs", age: 170, description: "Looking for goth sadbois ONLY", location: "London, UK", image: "https://www.thoughtco.com/thmb/A7NAjNeVDu1bOOaKG_BBPEyD6NU=/3838x2608/filters:fill(auto,1)/GettyImages-599958329-1bf5a3d1c2204eddb9ced96f16723860.jpg", swipe_status: false)
  p17 = Profile.create(name: "Musa", pronouns: "he/him/his", age: 684, description: "World taveler - gold/crypto investor", location: "Timbuktu, Mali", image: "https://magazine.northwestern.edu/assets/2019/Spring/6dd846b396/mansa-musa__FocusFillWzEyNDgsMTI0OCwieCIsMzYzXQ.jpg", swipe_status: false)
  p18 = Profile.create(name: "Cleo", pronouns: "she/they/hers", age: 2010, description: "Getting over a few exes, looking for a new adventure!", location: "Alexandria, Egypt", image: "https://grapefruitmoongallery.com/wp-content/uploads/2012/09/Henry_Clive_Cleopatra.jpg", swipe_status: false)
  p19 = Profile.create(name: "Jack", pronouns: "he/him/his", age: 133, description: "Cinema enthusiast. Fav films: Joker, American Psycho, Fight Club", location: "London, UK", image: "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/74/8d/55.jpg", swipe_status: false)
  p20 = Profile.create(name: "James", pronouns: "he/they/his", age: 66, description: "Rebel looking for a cause", location: "Hollywood, CA", image: "https://upload.wikimedia.org/wikipedia/commons/e/e6/James_Dean_in_Rebel_Without_a_Cause.jpg", swipe_status: false)
  p21 = Profile.create(name: "Joe", pronouns: "he/him/his", age: 69, description: "DM me for my twitter account", location: "Moscow, USSR", image: "https://upload.wikimedia.org/wikipedia/commons/6/68/Young_stalin_screenshot.jpg", swipe_status: false)
  p22 = Profile.create(name: "Paul", pronouns: "he/him/his", age: 40, description: "Let me take you out to dinner, I can get us the BEST table.", location: "New York, NY", image: "https://otakukart.com/wp-content/uploads/2021/06/American-Psycho-Jared-Leto.jpg", swipe_status: false)
  p23 = Profile.create(name: "Constance", pronouns: "she/her/hers", age: 148, description: "Looking for commitment", location: "Winchester, CA", image: "https://i.pinimg.com/originals/60/ea/43/60ea43a374554630470b8df1cec6e266.png", swipe_status: false)
  p24 = Profile.create(name: "Saeki", pronouns: "she/her/hers", age: 31, description: "I LOVE a good surprise lol", location: "Tokyo, Japan", image: "https://www.indiewire.com/wp-content/uploads/2019/10/Screen-Shot-2019-10-07-at-10.45.18-AM.png", swipe_status: false)
  p25 = Profile.create(name: "Alice", pronouns: "she/her/hers", age: 98, description: "So TIRED of no visitors over quarantine. Take me on a date!", location: "Denver, CO", image: "https://escapeworksdenver.com/wp-content/uploads/2016/03/denver-ghost-1.jpg", swipe_status: false)
  p26 = Profile.create(name: "Marie", pronouns: "she/they/hers", age: 112, description: "People say I'm hard to read? Wtf?", location: "Boston, MA", image: "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/6a/c3/b7.jpg", swipe_status: false)
  p27 = Profile.create(name: "Moonscar", pronouns: "he/him/his", age: 388, description: "Love long walks on the beach under the moonlit fog, my dessicated fingers wrapped around yours...", location: "Pensacola, FL", image: "https://i.pinimg.com/originals/4e/8e/75/4e8e7513ac19a5991f201f54c3a9150d.jpg", swipe_status: false)
  p28 = Profile.create(name: "Alister", pronouns: "he/they/theirs", age: 597, description: "Here for networking ONLY", location: "Your backyard", image: "https://ychef.files.bbci.co.uk/976x549/p04chzvm.jpg", swipe_status: false)
  p29 = Profile.create(name: "Opal", pronouns: "they/them/theirs", age: 821, description: "pls message first I am shy", location: "New York, NY", image: "https://images.saatchiart.com/saatchi/907609/art/3320811/2390698-HSC00001-32.jpg", swipe_status: false)
  p30 = Profile.create(name: "Sarah", pronouns: "she/her/hers", age: 376, description: "I have a tendency to girlboss a little too close to the sun.", location: "Salem, MA", image: "http://scoobydoodaily.weebly.com/uploads/9/5/5/6/9556804/4619176_orig.png", swipe_status: false)
  p31 = Profile.create(name: "Owen", pronouns: "he/him/his", age: 133, description: "Have hat, will travel", location: "Anaheim, CA", image: "https://cdn1.parksmedia.wdprapps.disney.com/media/blog/wp-content/uploads/2014/07/HHG806493.jpg", swipe_status: false)
  p32 = Profile.create(name: "Vincent", pronouns: "he/him/his", age: 201, description: "Too cool to care...", location: "New York, NY", image: "https://upload.wikimedia.org/wikipedia/commons/8/87/Vincent_van_Gogh_-_Head_of_a_skeleton_with_a_burning_cigarette_-_Google_Art_Project.jpg", swipe_status: false)
  p33 = Profile.create(name: "Karl", pronouns: "he/him/his", age: 139, description: "Looking for the opium of my heart", location: "London, England", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Karl_Marx_001.jpg/1280px-Karl_Marx_001.jpg", swipe_status: false)
  p34 = Profile.create(name: "Calamity", pronouns: 'she/her/hers', age: 119, description: 'Wild at heart', location: "Pierre, South Dakota", image: 'https://4.bp.blogspot.com/-5Cza4gnh2hs/U5CyoWSkbZI/AAAAAAAANC0/SUDSocV8Jlw/s1600/Calamity-Jane+3.png', swipe_status: false)
    
  profile_array = [p1.id, p2.id, p4.id, p5.id, p6.id, p7.id, p8.id, p9.id, p11.id, p12.id, 
  p13.id, p14.id, p15.id, p16.id, p17.id, p18.id, p19.id, p20.id, p21.id, p22.id, p23.id, 
  p24.id, p25.id, p26.id, p27.id, p28.id, p29.id, p30.id, p31.id, p32.id, p33.id, p34.id,].shuffle

  l1 = Like.create(user_id: u1.id, profile_id: p10.id, user_like: true, profile_like: true)
  l2 = Like.create(user_id: u1.id, profile_id: p3.id, user_like: true, profile_like: true)
  l3 = Like.create(user_id: u1.id, profile_id: profile_array[0], user_like: nil, profile_like: false)
  l4 = Like.create(user_id: u1.id, profile_id: profile_array[1], user_like: nil, profile_like: false)
  l5 = Like.create(user_id: u1.id, profile_id: profile_array[2], user_like: nil, profile_like: true)
  l6 = Like.create(user_id: u1.id, profile_id: profile_array[4], user_like: nil, profile_like: true)
  l7 = Like.create(user_id: u1.id, profile_id: profile_array[5], user_like: nil, profile_like: true)
  l8 = Like.create(user_id: u1.id, profile_id: profile_array[6], user_like: nil, profile_like: true)
  l9 = Like.create(user_id: u1.id, profile_id: profile_array[7], user_like: nil, profile_like: true)
  l10 = Like.create(user_id: u1.id, profile_id: profile_array[8], user_like: nil, profile_like: true)
  l11 = Like.create(user_id: u1.id, profile_id: profile_array[9], user_like: nil, profile_like: true)
  l12 = Like.create(user_id: u1.id, profile_id: profile_array[10], user_like: nil, profile_like: true)
  l13 = Like.create(user_id: u1.id, profile_id: profile_array[11], user_like: nil, profile_like: true)
  l14 = Like.create(user_id: u1.id, profile_id: profile_array[12], user_like: nil, profile_like: true)

  end

end
