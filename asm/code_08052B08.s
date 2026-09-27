	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08052B08
sub_08052B08: @ 0x08052B08
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r1, #0
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, _08052B24 @ =0x08C999C0
	ldrh r1, [r3]
	ldr r2, _08052B28 @ =0x0000FFFF
	b _08052B30
	.align 2, 0
_08052B24: .4byte 0x08C999C0
_08052B28: .4byte 0x0000FFFF
_08052B2C:
	adds r3, #0x10
	ldrh r1, [r3]
_08052B30:
	cmp r1, r2
	beq _08052B38
	cmp r1, r0
	bne _08052B2C
_08052B38:
	ldrh r2, [r3, #4]
	ldrh r3, [r3, #4]
	cmp r3, #3
	beq _08052B42
	b _08052C46
_08052B42:
	subs r0, r4, #7
	cmp r0, #0x31
	bls _08052B4A
	b _08052C46
_08052B4A:
	lsls r0, r0, #2
	ldr r1, _08052B54 @ =_08052B58
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08052B54: .4byte _08052B58
_08052B58: @ jump table
	.4byte _08052C28 @ case 0
	.4byte _08052C46 @ case 1
	.4byte _08052C46 @ case 2
	.4byte _08052C46 @ case 3
	.4byte _08052C46 @ case 4
	.4byte _08052C46 @ case 5
	.4byte _08052C46 @ case 6
	.4byte _08052C46 @ case 7
	.4byte _08052C46 @ case 8
	.4byte _08052C46 @ case 9
	.4byte _08052C46 @ case 10
	.4byte _08052C46 @ case 11
	.4byte _08052C46 @ case 12
	.4byte _08052C46 @ case 13
	.4byte _08052C46 @ case 14
	.4byte _08052C44 @ case 15
	.4byte _08052C44 @ case 16
	.4byte _08052C46 @ case 17
	.4byte _08052C46 @ case 18
	.4byte _08052C46 @ case 19
	.4byte _08052C46 @ case 20
	.4byte _08052C46 @ case 21
	.4byte _08052C46 @ case 22
	.4byte _08052C46 @ case 23
	.4byte _08052C46 @ case 24
	.4byte _08052C46 @ case 25
	.4byte _08052C46 @ case 26
	.4byte _08052C46 @ case 27
	.4byte _08052C46 @ case 28
	.4byte _08052C46 @ case 29
	.4byte _08052C46 @ case 30
	.4byte _08052C46 @ case 31
	.4byte _08052C46 @ case 32
	.4byte _08052C20 @ case 33
	.4byte _08052C20 @ case 34
	.4byte _08052C2C @ case 35
	.4byte _08052C30 @ case 36
	.4byte _08052C46 @ case 37
	.4byte _08052C46 @ case 38
	.4byte _08052C46 @ case 39
	.4byte _08052C46 @ case 40
	.4byte _08052C46 @ case 41
	.4byte _08052C46 @ case 42
	.4byte _08052C34 @ case 43
	.4byte _08052C38 @ case 44
	.4byte _08052C3C @ case 45
	.4byte _08052C3C @ case 46
	.4byte _08052C40 @ case 47
	.4byte _08052C40 @ case 48
	.4byte _08052C24 @ case 49
_08052C20:
	movs r2, #4
	b _08052C46
_08052C24:
	movs r2, #5
	b _08052C46
_08052C28:
	movs r2, #0xc
	b _08052C46
_08052C2C:
	movs r2, #6
	b _08052C46
_08052C30:
	movs r2, #0xd
	b _08052C46
_08052C34:
	movs r2, #7
	b _08052C46
_08052C38:
	movs r2, #8
	b _08052C46
_08052C3C:
	movs r2, #9
	b _08052C46
_08052C40:
	movs r2, #0xa
	b _08052C46
_08052C44:
	movs r2, #0xb
_08052C46:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
