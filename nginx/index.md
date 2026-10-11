# Nginx lab

Hello dear student.

This lab is a basic nginx lesson that is an example of a runlab with a snapshot.

That is, we do not cold boot the microvm, we restore a snapshot from a running state with the nginx service already running

This machine has nginx already running. You do not need to start it.

## Open its page

Click `nginx` in the bar at the top. It opens in a new browser tab to the nginx web server and serves the stock nginx page.

The page is nginx's welcome page.

## See it from this machine

We can alternatively use the `curl` CLI to request the same information:

```shell
curl http://127.0.0.1/
```

The reply is the same welcome page.

## Check the service

```shell
systemctl status nginx
```

Active and running means nginx is up.

## Summary

The web server was already listening when this lab opened:

- the nginx link opens that page in your browser
- `curl http://127.0.0.1/` fetches the same page from this machine
- `systemctl status nginx` shows the service is running

Congratulations on completing this lab.
