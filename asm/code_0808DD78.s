	.include "macro.inc"

	.syntax unified

	thumb_func_start IsCharacterForceDeployed
IsCharacterForceDeployed: @ 0x0808DD78
	push {r4, lr}
	adds r4, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808DE5E
	ldr r0, _0808DD98 @ =0x0202BBF8
	ldrb r1, [r0, #0x1b]
	cmp r1, #2
	beq _0808DDAA
	cmp r1, #2
	bgt _0808DD9C
	cmp r1, #1
	beq _0808DDA2
	b _0808DDB4
	.align 2, 0
_0808DD98: .4byte 0x0202BBF8
_0808DD9C:
	cmp r1, #3
	beq _0808DDB0
	b _0808DDB4
_0808DDA2:
	cmp r4, #3
	bne _0808DDB4
_0808DDA6:
	movs r0, #1
	b _0808DE60
_0808DDAA:
	cmp r4, #1
	bne _0808DDB4
	b _0808DDA6
_0808DDB0:
	cmp r4, #2
	beq _0808DDA6
_0808DDB4:
	ldrb r0, [r0, #0xe]
	subs r0, #0x1a
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	bhi _0808DE5E
	lsls r0, r0, #2
	ldr r1, _0808DDCC @ =_0808DDD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808DDCC: .4byte _0808DDD0
_0808DDD0: @ jump table
	.4byte _0808DE36 @ case 0
	.4byte _0808DE24 @ case 1
	.4byte _0808DE36 @ case 2
	.4byte _0808DE5E @ case 3
	.4byte _0808DE2A @ case 4
	.4byte _0808DE5E @ case 5
	.4byte _0808DE5E @ case 6
	.4byte _0808DE5E @ case 7
	.4byte _0808DE36 @ case 8
	.4byte _0808DE5E @ case 9
	.4byte _0808DE5E @ case 10
	.4byte _0808DE5E @ case 11
	.4byte _0808DE30 @ case 12
	.4byte _0808DE5E @ case 13
	.4byte _0808DE5E @ case 14
	.4byte _0808DE5E @ case 15
	.4byte _0808DE36 @ case 16
	.4byte _0808DE5E @ case 17
	.4byte _0808DE44 @ case 18
	.4byte _0808DE5E @ case 19
	.4byte _0808DE4A @ case 20
_0808DE24:
	cmp r4, #1
	bne _0808DE5E
	b _0808DDA6
_0808DE2A:
	cmp r4, #0x22
	bne _0808DE5E
	b _0808DDA6
_0808DE30:
	cmp r4, #0x14
	bne _0808DE5E
	b _0808DDA6
_0808DE36:
	cmp r4, #0x2d
	beq _0808DDA6
	cmp r4, #1
	beq _0808DDA6
	cmp r4, #2
	bne _0808DE5E
	b _0808DDA6
_0808DE44:
	cmp r4, #0x26
	bne _0808DE5E
	b _0808DDA6
_0808DE4A:
	cmp r4, #0x2d
	beq _0808DDA6
	cmp r4, #1
	beq _0808DDA6
	cmp r4, #2
	beq _0808DDA6
	cmp r4, #0x26
	beq _0808DDA6
	cmp r4, #0x27
	beq _0808DDA6
_0808DE5E:
	movs r0, #0
_0808DE60:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
