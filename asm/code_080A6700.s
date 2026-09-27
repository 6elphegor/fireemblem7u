	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateTactMainHandShadow
UpdateTactMainHandShadow: @ 0x080A6700
	push {r4, lr}
	ldr r1, _080A6724 @ =0x08CE45C0
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	ldrsh r4, [r0, r1]
	movs r2, #2
	ldrsh r1, [r0, r2]
	ldrb r2, [r0, #4]
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r0, r4, #0
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6724: .4byte 0x08CE45C0
