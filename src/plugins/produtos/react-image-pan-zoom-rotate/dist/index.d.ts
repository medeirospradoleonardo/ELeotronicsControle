/// <reference types="react" />
import PanViewer from './PanViewer';
declare type ReactPanZoomProps = {
    image: string;
    alt?: string;
    ref?: any;
};
declare const ReactPanZoom: ({ image, alt, ref }: ReactPanZoomProps) => JSX.Element;
export { PanViewer };
export default ReactPanZoom;
