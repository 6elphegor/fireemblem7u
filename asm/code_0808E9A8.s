	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808E9A8
sub_0808E9A8: @ 0x0808E9A8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r5, _0808EA20 @ =0x02010694
	adds r0, #0x2f
	ldrb r0, [r0]
	bl GetPrepOptionCount
	adds r3, r0, #0
	lsls r3, r3, #1
	adds r3, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #5
	movs r1, #6
	movs r2, #9
	bl DrawUiFrame2
	movs r4, #0
	movs r6, #0xe0
	lsls r6, r6, #1
_0808E9D2:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0808EA0A
	adds r0, r5, #0
	bl ClearText
	ldr r1, _0808EA24 @ =0x08CC50A0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DecodeMsg
	ldr r1, _0808EA28 @ =0x02022C6C
	adds r1, r6, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #8
	adds r6, #0x80
_0808EA0A:
	adds r4, #1
	cmp r4, #3
	ble _0808E9D2
	movs r0, #3
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EA20: .4byte 0x02010694
_0808EA24: .4byte 0x08CC50A0
_0808EA28: .4byte 0x02022C6C
