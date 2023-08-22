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
      }
    }
    schedules{
      day
      description
      intervals{
        title
        begin
        end
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

