class TopicsController < ApplicationController
  before_filter :setup_client
  before_filter :setup_cache

  DATABASE = [{"name"=>"G20-Gipfel", "article"=>{"id"=>"143696e2d8ef0a7a482a9bda332046bb", "title"=>"„Muss Montag arbeiten und will fünf Stunden schlafen“", "summary"=>"„Tony versteht das“: Wladimir Putin hat den G-20-Gipfel vor Veröffentlichung der Abschlusserklärung verlassen. Aus Brisbane verabschiedete sich der russische Präsident mit einer harten Medienkritik.", "url"=>"http://www.welt.de/134386538", "pictureUrls"=>["https://socialreporter.herokuapp.com/pictures/d6cd76a404b2e51a853670aa6b13d734"]}}, {"name"=>"Bundestagswahl", "article"=>{"id"=>"676621ce1e4d6a53b00b02ea2ce91107", "title"=>"„Man sollte Schröder ein gutes Auskommen gönnen“", "summary"=>"SPD-Fraktionschef Oppermann nimmt Altkanzler Schröder in Schutz, der von dem niedersächsischen Unternehmer Carsten Maschmeyer zwei Millionen Euro für die Rechte an seinen Memoiren bekommen hat.", "url"=>"http://www.welt.de/134358385", "pictureUrls"=>["https://socialreporter.herokuapp.com/pictures/27d729e6e3634d9e388ab2c92067d7a2", "https://socialreporter.herokuapp.com/pictures/1ab4f2a83505c81d325b743e24c80a9e", "https://socialreporter.herokuapp.com/pictures/4a320a7c0e63681b9d5c7a89cf0921e6", "https://socialreporter.herokuapp.com/pictures/0bfddaa3096c99e941ee0fdd3030fa4f"]}}, {"name"=>"Zweiter Weltkrieg", "article"=>{"id"=>"800981c31854248cb43586e8427a80ee", "title"=>"Jahrhundert-Mathematiker Grothendieck gestorben", "summary"=>"In Berlin wurde er geboren, jetzt starb Alexander Grothendieck mit 86 Jahren in Frankreich. Er war einer der größten Mathematiker des 20. Jahrhunderts. Seit fast 25 Jahren lebte er wie ein Eremit.", "url"=>"http://www.welt.de/134359675", "pictureUrls"=>["https://socialreporter.herokuapp.com/pictures/a9de2feb895b171c38c551d4a20556e3"]}}, {"name"=>"Olympische Spiele", "article"=>{"id"=>"5fb57aefac5ec5aa15729d0b3dbb712f", "title"=>"„Folter gehört zu Mexiko  wie Tequila-Trinken“", "summary"=>"Nach dem Verschwinden von 43 Studenten wächst der Widerstand gegen Korruption, staatliche Willkür und Drogen-Kartelle.", "url"=>"http://www.bild.de/politik/ausland/mexiko/massenproteste-nach-studenten-massaker-38571296.bild.html", "pictureUrls"=>["http://bilder.bild.de/fotos-skaliert/141112montevideonov122014chairswithportrait_41931360_mbqf-1415800727-38571312/4,w=550,c=0.bild.jpg"]}}, {"name"=>"Olympia", "article"=>{"id"=>"7f7124f5597fd1e970dc581df21c804b", "title"=>"Der Tiefstapler", "summary"=>"Felix Neureuther hat sich über den Sport hinaus einen eigenen Namen gemacht. Von Rückschlägen lässt sich der Skirennläufer nicht aufhalten. Er denkt schon einen Schritt weiter", "url"=>"http://www.welt.de/134380014", "pictureUrls"=>["http://media.zenfs.com/de-DE/blogs/neureuther-de/Felix-Blog-nachdenklich-gespiegelt.jpg"]}}, {"name"=>"WM 2014", "article"=>{"id"=>"97d0c7b6112d526dd7f79f9709f8a881", "title"=>"Weltmeister Özil geehrt", "summary"=>"Große Ehre für Mesut Özil! Unser Weltmeister hat beim Laureus Sports Award in Berlin den Ehrenpreis verliehen bekommen.", "url"=>"http://www.bild.de/sport/2014/mesut-oezil/weltmeister-geehrt-38542668.bild.html", "pictureUrls"=>["http://bilder.bild.de/fotos-skaliert/sportallgemein_ges_laureusmedienpreis2014ber_41943843_mbqf-1415823889-38545016/1,w=550,c=0.bild.jpg"]}}, {"name"=>"DFB-Pokal", "article"=>{"id"=>"04cb10eda935b2194ac32da18ff8c3f9", "title"=>"„Herr Watzke hat doch mit dem Streit angefangen“", "summary"=>"Bayern-Präsident Karl Hopfner hofft auf einen normalen Umgang mit dem BVB. Ein Angebot für Marco Reus gäbe es noch nicht. Guardiola soll verlängern, und Uli Hoeneß bekommt bald einen neuen Job.", "url"=>"http://www.welt.de/134371605", "pictureUrls"=>["https://socialreporter.herokuapp.com/pictures/7f18be6e128433354eea797db3158a37", "https://socialreporter.herokuapp.com/pictures/7a966b761f203ad9ce0a6428265244db"]}}, {"name"=>"Landtagswahl", "article"=>{"id"=>"4da0466ca099881b2944906b2ba37fab", "title"=>"Und wieder einer raus", "summary"=>"", "url"=>"http://www.welt.de/134360477", "pictureUrls"=>["http://img.welt.de/img/vermischtes/crop113301110/9916939207-ci3x2l-w900/Ursula-von-der-Leyen.jpg"]}}, {"name"=>"Weihnachten", "article"=>{"id"=>"cfb63c70cc5a1e5bc524fd8f25f878d0", "title"=>"Der heikle Wunsch vom Zweitwohnsitz in Österreich", "summary"=>"Zweitwohnsitze sind bei betuchten Bürgern beliebt, auch in Urlaubsgebieten. Doch viele Gemeinden in Österreich blockieren den Erwerb. Wer versucht, die Regeln zu umgehen, dem drohen hohe Strafen.", "url"=>"http://www.welt.de/134367800", "pictureUrls"=>["https://socialreporter.herokuapp.com/pictures/364e66c2b2f3a4793fedcb6f59bac435"]}}, {"name"=>"Fußball-WM", "article"=>{"id"=>"77d07f4a2bf4849563c00ab2713b4b36", "title"=>"Lieblicher Übergang", "summary"=>"Spaniens Trainer Del Bosque forciert gegen Deutschland die Verjüngung seines Teams", "url"=>"http://www.welt.de/134380021", "pictureUrls"=>["http://www.motorvision.de/bild/3/5/4/8/9/Del_Bosque_zaehlt_die_DFB-Elf_zu_den_Favoriten.jpg"]}}, {"name"=>"World Cup", "article"=>{"id"=>"429132c5fb5aed611fb3ded5aac29d4b", "title"=>"Wahl zum Sportler des Jahres ist gestartet", "summary"=>"Zu den Favoriten zählen Fußballtrainer Oliver Reck, Tischtennisstar Timo Boll und Borussia Düsseldorf", "url"=>"http://www.welt.de/134000104", "pictureUrls"=>["http://www.dortmund.de/media/bilder_1/pool/einmalig/einmalig_news_bilder/sportler_des_jahres_11_12_20_lb.jpg"]}}]

  def index
    # @topics = @client.topics.uniq { |topic| topic.name }
    render json: DATABASE
  end

  def show
    # @topic = @client.topic(params[:id])
    topic = DATABASE.find({}) { |topic| topic['article']['id'] == params[:id] }
    render json: topic
  end

  def social
    # topic = @client.topic(params[:id])
    topic = DATABASE.find({}) { |topic| topic['article']['id'] == params[:id] }

    @tweets = Rails.cache.fetch(['social', params[:id]]) do 
      twitter = TwitterClient.new
      twitter.tweets_for(Topic.new(topic['name'])).reject { |tweet| tweet.video_id.nil? }.uniq { |tweet| tweet.video_id }[0...5]
    end
  end

  def upload
    youtube = YoutubeClient.new
    render json: youtube.upload(params[:name], params[:video].path)
  end

  private

  def setup_client
    @client ||= IpoolClient.new
  end

  def setup_cache
    expires_in 3.minutes, public: true
  end
end
