	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08040CFC
sub_08040CFC: @ 0x08040CFC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x38
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bls _08040DA0
	movs r0, #0
	strb r0, [r1]
	adds r4, r6, #0
	adds r4, #0x3a
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, _08040D78 @ =0x0203D90C
	adds r1, #0xa0
	ldrb r0, [r4]
	ldrb r1, [r1]
	bl __umodsi3
	strb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x39
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r0, _08040D7C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08040D50
	movs r0, #0x7d
	bl m4aSongNumStart
_08040D50:
	ldrb r0, [r5]
	cmp r0, #0
	bne _08040DA0
	adds r0, r6, #0
	adds r0, #0x3b
	ldr r1, _08040D80 @ =0x08B98AEC
	ldr r1, [r1]
	ldrb r2, [r0]
	adds r4, r0, #0
	ldrb r0, [r4]
	ldrb r1, [r1, #6]
	cmp r0, r1
	beq _08040D88
	ldr r1, _08040D84 @ =0x000003CE
	adds r0, r2, r1
	movs r1, #1
	bl PutSioText
	b _08040D90
	.align 2, 0
_08040D78: .4byte 0x0203D90C
_08040D7C: .4byte 0x0202BBF8
_08040D80: .4byte 0x08B98AEC
_08040D84: .4byte 0x000003CE
_08040D88:
	ldr r0, _08040DA8 @ =0x000003CD
	movs r1, #1
	bl PutSioText
_08040D90:
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r1, _08040DAC @ =0x0203DC9C
	ldrb r0, [r4]
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08040DA0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040DA8: .4byte 0x000003CD
_08040DAC: .4byte 0x0203DC9C
