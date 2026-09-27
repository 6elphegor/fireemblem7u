	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSupportTalkSong
GetSupportTalkSong: @ 0x08078B4C
	push {r4, r5, lr}
	adds r5, r3, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	adds r2, r0, #0
	cmp r2, #0
	bne _08078B82
	ldr r2, _08078B64 @ =0x08C9F9F4
	b _08078B6A
	.align 2, 0
_08078B64: .4byte 0x08C9F9F4
_08078B68:
	adds r2, #0x14
_08078B6A:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08078B82
	ldrb r1, [r2, #1]
	cmp r0, r4
	bne _08078B7A
	cmp r1, r3
	beq _08078B82
_08078B7A:
	cmp r1, r4
	bne _08078B68
	cmp r0, r3
	bne _08078B68
_08078B82:
	ldr r1, [r2, #0x10]
	cmp r1, #0
	beq _08078BC8
	subs r0, r5, #1
	lsls r0, r0, #3
	adds r3, r1, #0
	lsrs r3, r0
	movs r0, #0xff
	ands r3, r0
	cmp r3, #4
	bhi _08078BC8
	lsls r0, r3, #2
	ldr r1, _08078BA4 @ =_08078BA8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078BA4: .4byte _08078BA8
_08078BA8: @ jump table
	.4byte _08078BC8 @ case 0
	.4byte _08078BBC @ case 1
	.4byte _08078BC0 @ case 2
	.4byte _08078BC4 @ case 3
	.4byte _08078BC4 @ case 4
_08078BBC:
	movs r0, #0x41
	b _08078BCA
_08078BC0:
	movs r0, #0x4c
	b _08078BCA
_08078BC4:
	movs r0, #0x6a
	b _08078BCA
_08078BC8:
	movs r0, #0
_08078BCA:
	pop {r4, r5}
	pop {r1}
	bx r1
