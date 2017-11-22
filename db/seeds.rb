contacts = [{
	first_name: "Marylyn",
	last_name: "Tilahun",
	project: "Personal Site",
	business: "Financial Advisor",
	last_contacted: Date.parse("10-11-2017"),
	date_met: Date.parse("8-11-2017"),
	where_met: "Startup Meetup at Founders Institute",
	email: "marylyn.tilahun@outlook.com",
}, {
	first_name: "James",
	last_name: "Brown",
	project: "Business Site",
	business: "EDRC Studio",
	last_contacted: Date.parse("10-11-2017"),
	date_met: Date.parse("25-9-2017"),
	where_met: "Through Janae",
	email: "titaniumceo@gmail.com",
}, {
	first_name: "Janae",
	last_name: "Brown",
	project: "Personal Site",
	business: "Physical Therapist",
	last_contacted: Date.parse("3-11-2017"),
	date_met: Date.parse("23-9-2017"),
	where_met: "USBA Meetup",
	email: "drjanaebrownpt@gmail.com",
}, {
	first_name: "Silvia",
	last_name: "Pangaro",
	project: "Personal Site",
	business: "Photographer",
	last_contacted: Date.parse("24-10-2017"),
	date_met: Date.parse("19-10-2017"),
	where_met: "LA Startup Nation Meetup",
	email: "silvia@silviapangaro.com",
}, {
	first_name: "Amy",
	last_name: "Harrin",
	project: "Personal Site",
	business: "Affiliate Marketing",
	last_contacted: Date.parse("14-10-2017"),
	date_met: Date.parse("23-9-2017"),
	where_met: "SEO Meetup at General Assembly",
	email: "amyharrin@outlook.com",
}, {
	first_name: "Tara",
	last_name: "",
	project: "Business Site",
	business: "Mail Gifts and Wine",
	last_contacted: Date.parse("8-11-2017"),
	date_met: Date.parse("1-9-2017"),
	where_met: "Mail Gifts and Wine",
	email: "",
}, {
	first_name: "Courtenay",
	last_name: "Turner",
	project: "Business Site",
	business: "Icelandic Travel Guide",
	last_contacted: Date.parse("18-11-2017"),
	date_met: Date.parse("18-11-2017"),
	where_met: "Brandyn Wynn's gym",
	email: "",
}, {
	first_name: "Brandyn",
	last_name: "Wynn",
	project: "Business Site",
	business: "Calisthenics",
	last_contacted: Date.parse("18-11-2017"),
	date_met: Date.parse("18-11-2017"),
	where_met: "Brandyn Wynn's gym",
	email: ""
}]

contacts.each do |contact|
	Contact.create(contact)
end
