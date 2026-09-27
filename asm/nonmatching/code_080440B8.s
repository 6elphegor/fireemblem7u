	.include "macro.inc"

	.syntax unified

	thumb_func_start GC_ConnectToFE6
GC_ConnectToFE6: @ 0x080440B8
	push {r4, lr}
	adds r4, r0, #0
	bl UnpackUiWindowFrameGraphics
	ldr r0, _080440DC @ =0x0203DA60
	ldr r1, _080440E0 @ =0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl InitTextFont
	ldr r0, _080440E4 @ =0x08B999D8
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080440DC: .4byte 0x0203DA60
_080440E0: .4byte 0x06001800
_080440E4: .4byte 0x08B999D8
