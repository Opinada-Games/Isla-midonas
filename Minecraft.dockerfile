# Use OpenJDK 21 (Slim)
FROM openjdk:21-jdk-slim

# Create a non-root user "minecraft" within the container
RUN useradd -ms /bin/bash minecraft

# Set environment variables
ENV MINECRAFT_HOME /minecraft

# Create necessary directories and give ownership to the "minecraft" user
RUN mkdir -p \
    "$MINECRAFT_HOME/world" \
    "$MINECRAFT_HOME/world_nether" \
    "$MINECRAFT_HOME/lobby" \
    "$MINECRAFT_HOME/plugins/bluemap"
RUN chown -R minecraft:minecraft /minecraft

# Switch to the new user
USER minecraft

# Set the working directory
WORKDIR $MINECRAFT_HOME

# Copy server files into the container
# (Adjust these COPY lines for your actual paths)
COPY ./purpur.jar $MINECRAFT_HOME
COPY ./plugins $MINECRAFT_HOME/plugins
COPY ./config $MINECRAFT_HOME/config

# Expose necessary ports
EXPOSE 25565 8100 19132/udp

# Accept the EULA
RUN echo "eula=true" > eula.txt

# Run the Minecraft server with optimized memory usage (up to 12G)
CMD ["java", "-Xmx12G", "-Xms4G", "-jar", "purpur.jar", "nogui"]
