	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitGainSupportExp
UnitGainSupportExp: @ 0x080266E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	ldr r0, _0802673C @ =0x0202BBF8
	mov r8, r0
	ldrb r3, [r0, #0x1b]
	cmp r3, #1
	beq _08026730
	ldr r0, [r2]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026730
	adds r0, #0xe
	adds r0, r0, r1
	ldrb r6, [r0]
	adds r0, r2, #0
	adds r0, #0x32
	adds r7, r0, r1
	ldrb r5, [r7]
	ldr r4, _08026740 @ =0x08B94184
	adds r0, r2, #0
	bl GetUnitSupportLevel
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r5, r6
	cmp r0, r1
	ble _08026722
	subs r6, r1, r5
_08026722:
	adds r0, r5, r6
	strb r0, [r7]
	mov r1, r8
	ldrh r1, [r1, #0x16]
	adds r0, r1, r6
	mov r2, r8
	strh r0, [r2, #0x16]
_08026730:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802673C: .4byte 0x0202BBF8
_08026740: .4byte 0x08B94184
