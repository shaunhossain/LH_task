String conferenceListQuery() => r'''
{
  conferences{
    id
    name
    slogan
    startDate
  }
}
''';



String conferenceQuery({required String id}) => r'''
{
  conference(id: "'''"$id"r'''") {
    organizers{
      name
      about
      image{
        url
      }
    }
    speakers{
      name
      about
      image{
        url
      }
      social{
        github
        twitch
        facebook
        dribble
      }
    }
  schedules{
      day
      description
      intervals{
        sessions{
          day
          title
          begin
          end
        }
      }
    }
    sponsors{
      name
      image{
        url
      }
      about
    }
  }
}
''';

String sponsorListQuery() => r'''
{
  sponsors{
    name
    type
    image{
      url
    }
  }
}
''';

