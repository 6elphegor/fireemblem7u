	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawMinimap
DrawMinimap: @ 0x080A3298
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r0, _080A32CC @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _080A32D0 @ =0x02023460
	movs r1, #0
	bl TmFill
	adds r0, r5, #0
	bl InitChapterPreviewMap
	adds r0, r4, #0
	bl ApplyMinimapGraphics
	adds r0, r6, #0
	adds r1, r4, #0
	bl DrawMinimapInternal
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A32CC: .4byte 0x02022C60
_080A32D0: .4byte 0x02023460
