FROM openjdk:21-jdk-slim

# Set environment variables
ENV MINECRAFT_HOME /minecraft

# Create necessary directories
RUN mkdir -p $MINECRAFT_HOME \
    $MINECRAFT_HOME/world \
    $MINECRAFT_HOME/world_nether \
    $MINECRAFT_HOME/lobby \
    $MINECRAFT_HOME/plugins/bluemap

WORKDIR $MINECRAFT_HOME

# Copy server files into the container
COPY ./server.jar $MINECRAFT_HOME
COPY ./plugins $MINECRAFT_HOME/plugins
COPY ./config $MINECRAFT_HOME/config

# Expose necessary ports
EXPOSE 25565 8100 19132/udp

# Accept EULA
RUN echo "eula=true" > eula.txt

# Run the Minecraft server with optimized memory usage (up to 12G)
CMD ["java", "-Xmx12G", "-Xms4G", "-jar", "purpur.jar", "nogui"]
