# Dockerfile Standard

## USER as non-root
Using root user is bad. The user should not be root. 

## COPY
COPY dependencies list and install, unless the install step requires src files.
You'll get the benefits from Docker cache. Then COPY from src to dest (container).

## Only one CMD 
This line is the default init command for the container. It can be overwritten at runtime.

```
CMD ["yarn","start"]
```

## ENTRYPOINT
If you would like your container to run the same executable every time, then you should consider using ENTRYPOINT.

```
ENTRYPOINT ["yarn"]
CMD ["start"]
```

## Include PORT
Be kind and let your fellow developer know what port to expose.
