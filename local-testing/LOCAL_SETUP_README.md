# 🗨️ Amazon Connect Chat Interface - Local Component Showcase

This directory contains a complete local setup for exploring the Amazon Connect Chat Interface components **without requiring any backend services or AWS configuration**.

## 🚀 Quick Start

### Prerequisites
- Node.js (version 15.0.0 or higher)
- A web browser

### Setup Steps

1. **Install Dependencies** (from the project root):
   ```bash
   npm install
   ```

2. **Build the Chat Interface**:
   ```bash
   npm run dev-build
   ```
   This creates the `amazon-connect-chat-interface.js` file needed for local testing.

3. **Start Local Server**:
   ```bash
   cd local-testing
   http-server -p 8080
   ```
   Or if you don't have http-server installed:
   ```bash
   npm install -g http-server
   http-server -p 8080
   ```

4. **Open in Browser**:
   Navigate to: `http://localhost:8080/component-showcase.html`

## 📁 Files in This Directory

- **`component-showcase.html`** - 🎯 **START HERE!** Interactive showcase of all components
- **`index.html`** - Original example requiring backend setup
- **`hostedWidget.html`** - Hosted widget example
- **`amazon-connect-chat-interface.js`** - Built chat interface library
- **`backendEndpoints.js`** - Backend configuration (not needed for showcase)

## 🎮 Component Showcase Features

The `component-showcase.html` file provides:

### Interactive Demo Controls
- **Initialize Chat Widget** - Sets up the chat interface
- **Simulate Incoming Message** - Shows how messages appear
- **Simulate Typing** - Demonstrates typing indicators
- **Custom Message Simulation** - Send your own test messages
- **Reset Chat** - Start over with a clean slate

### Multiple Widget Views
- **Default Theme** - Standard Amazon Connect styling
- **Custom Theme** - Example of themed customization
- **Side-by-side Comparison** - See different configurations

### Component Features Demonstrated
- ✅ Chat Composer with Rich Text Support
- ✅ Message Bubbles with Timestamps
- ✅ Typing Indicators
- ✅ File Attachment Support
- ✅ Emoji Picker
- ✅ Message Status Indicators
- ✅ Participant Management
- ✅ Rich Message Components
- ✅ Customizable Themes
- ✅ Responsive Design
- ✅ Accessibility Features
- ✅ Message History

## 🎨 Customization Examples

The showcase demonstrates various customization options:

```javascript
// Basic initialization
connect.ChatInterface.init({
    containerId: 'your-container-id'
});

// With custom theme
connect.ChatInterface.init({
    containerId: 'your-container-id',
    theme: {
        primaryColor: '#007bff',
        chatBubbleIncomingColor: '#e3f2fd',
        chatBubbleOutgoingColor: '#007bff',
        fontFamily: 'Roboto, sans-serif'
    }
});
```

## 🔧 Development Workflow

### Making Changes to Components

1. **Edit Source Files** in `/src/components/`
2. **Rebuild the Interface**:
   ```bash
   npm run dev-build
   ```
3. **Refresh Browser** to see changes

### Watch Mode for Development
```bash
npm run dev-watch
```
This automatically rebuilds when you make changes to source files.

### Running Tests
```bash
npm test
```

## 🌐 Production Integration

Once you're satisfied with the local setup, you can integrate into production:

### Option 1: Hosted Widget (Easiest)
Use Amazon Connect's hosted widget with your custom bundle:
```html
<script type="text/javascript">
  amazon_connect('customerChatInterfaceUrl', './amazon-connect-chat-interface.js');
</script>
```

### Option 2: Custom Integration
Host the files yourself and integrate with your backend:
```html
<script src="amazon-connect-chat-interface.js"></script>
<script>
  connect.ChatInterface.initiateChat({
    name: 'Customer Name',
    region: 'us-east-1',
    apiGatewayEndpoint: 'your-api-gateway-endpoint',
    contactFlowId: 'your-contact-flow-id',
    instanceId: 'your-instance-id'
  });
</script>
```

## 🛠️ Available NPM Scripts

From the project root directory:

- `npm run dev-build` - Build development version
- `npm run dev-watch` - Build and watch for changes
- `npm run build` - Build production version
- `npm run test` - Run tests
- `npm run coverage` - Run tests with coverage

## 📚 Additional Resources

- [Main Project README](../README.md)
- [Documentation](../DOCUMENTATION.md)
- [Amazon Connect Chat UI Examples](https://github.com/amazon-connect/amazon-connect-chat-ui-examples)
- [Amazon Connect Developer Guide](https://docs.aws.amazon.com/connect/latest/adminguide/)

## 🐛 Troubleshooting

### Chat Widget Not Appearing
1. Check browser console for JavaScript errors
2. Ensure `amazon-connect-chat-interface.js` file exists
3. Try rebuilding with `npm run dev-build`

### Build Errors
1. Ensure Node.js version is 15.0.0 or higher
2. Delete `node_modules` and run `npm install` again
3. Check for any missing dependencies

### Server Issues
1. Make sure port 8080 is not in use by another application
2. Try a different port: `http-server -p 3000`
3. Check firewall settings if accessing from another device

## 💡 Tips

- **Use Browser DevTools** to inspect components and understand the structure
- **Modify the showcase HTML** to test different configurations
- **Check the console** for helpful debugging information
- **Experiment with themes** to match your brand
- **Test responsive behavior** by resizing the browser window

---

**Happy Coding! 🚀**

For questions or issues, refer to the main project documentation or create an issue in the GitHub repository.