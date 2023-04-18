FROM 498664601760.dkr.ecr.us-east-1.amazonaws.com/python27:latest

# Add sample application
ADD application.py /tmp/application.py
ADD entrypoint.sh /tmp/entrypoint.sh

EXPOSE 8000

RUN mkdir -p /tmp/sample-app
RUN touch /tmp/sample-app/sample-app.log

HEALTHCHECK --interval=5s --timeout=5s CMD curl --fail http://localhost:8000 || exit 1

# Run it
#ENTRYPOINT ["python", "/tmp/application.py"]
ENTRYPOINT ["/tmp/entrypoint.sh"]
