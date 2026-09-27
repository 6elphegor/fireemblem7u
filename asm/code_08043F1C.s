	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043F1C
sub_08043F1C: @ 0x08043F1C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _08043F4C @ =0x02023460
	movs r1, #6
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #2
	movs r2, #9
	movs r3, #0x10
	bl PutUiWindowFrame
	movs r0, #2
	bl EnableBgSync
	adds r5, #0x68
	strh r4, [r5]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043F4C: .4byte 0x02023460
