	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043EB4
sub_08043EB4: @ 0x08043EB4
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ApplySystemGraphics
	adds r0, r4, #0
	bl sub_080ACA90
	ldr r0, _08043EFC @ =0x08B99870
	bl Proc_EndEach
	adds r0, r4, #0
	bl sub_08043EA0
	str r0, [r4, #0x54]
	bl UnpackUiWindowFrameGraphics
	ldr r0, _08043F00 @ =0x02023460
	movs r1, #4
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0x12
	movs r2, #0x10
	movs r3, #0xb
	bl PutUiWindowFrame
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043EFC: .4byte 0x08B99870
_08043F00: .4byte 0x02023460
