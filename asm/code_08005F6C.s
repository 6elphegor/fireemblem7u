	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08005F6C
sub_08005F6C: @ 0x08005F6C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	cmp r7, #0
	bne _08005F7E
	bl Text_DrawString
_08005F7E:
	cmp r4, #0
	bne _08005F84
	movs r4, #1
_08005F84:
	ldr r0, _08005FB0 @ =0x08B86140
	movs r1, #3
	bl Proc_Start
	adds r2, r0, #0
	str r5, [r2, #0x2c]
	str r6, [r2, #0x30]
	adds r0, #0x36
	movs r1, #0
	strb r4, [r0]
	subs r0, #2
	strb r7, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #1
	strb r0, [r5, #7]
	adds r0, r6, #0
	bl GetStringLineEnd
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08005FB0: .4byte 0x08B86140
