	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemCantUseMsgid
GetItemCantUseMsgid: @ 0x08026F4C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r0, r6, #0
	bl GetItemIndex
	subs r0, #0x55
	cmp r0, #0x45
	bls _08026F5E
	b _080270F0
_08026F5E:
	lsls r0, r0, #2
	ldr r1, _08026F68 @ =_08026F6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026F68: .4byte _08026F6C
_08026F6C: @ jump table
	.4byte _08027084 @ case 0
	.4byte _080270F0 @ case 1
	.4byte _080270F0 @ case 2
	.4byte _080270F0 @ case 3
	.4byte _080270F0 @ case 4
	.4byte _08027084 @ case 5
	.4byte _08027084 @ case 6
	.4byte _08027084 @ case 7
	.4byte _08027084 @ case 8
	.4byte _08027084 @ case 9
	.4byte _08027084 @ case 10
	.4byte _08027084 @ case 11
	.4byte _08027084 @ case 12
	.4byte _08027084 @ case 13
	.4byte _080270C6 @ case 14
	.4byte _080270C6 @ case 15
	.4byte _080270C6 @ case 16
	.4byte _080270C6 @ case 17
	.4byte _080270C6 @ case 18
	.4byte _0802708C @ case 19
	.4byte _08027094 @ case 20
	.4byte _0802709C @ case 21
	.4byte _08027084 @ case 22
	.4byte _08027084 @ case 23
	.4byte _08027084 @ case 24
	.4byte _08027084 @ case 25
	.4byte _08027084 @ case 26
	.4byte _080270F0 @ case 27
	.4byte _080270F0 @ case 28
	.4byte _080270F0 @ case 29
	.4byte _080270F0 @ case 30
	.4byte _080270F0 @ case 31
	.4byte _080270F0 @ case 32
	.4byte _080270F0 @ case 33
	.4byte _080270F0 @ case 34
	.4byte _0802708C @ case 35
	.4byte _080270F0 @ case 36
	.4byte _080270F0 @ case 37
	.4byte _080270F0 @ case 38
	.4byte _080270F0 @ case 39
	.4byte _080270F0 @ case 40
	.4byte _080270F0 @ case 41
	.4byte _080270F0 @ case 42
	.4byte _080270F0 @ case 43
	.4byte _080270F0 @ case 44
	.4byte _080270F0 @ case 45
	.4byte _080270F0 @ case 46
	.4byte _080270F0 @ case 47
	.4byte _080270F0 @ case 48
	.4byte _080270F0 @ case 49
	.4byte _080270C6 @ case 50
	.4byte _080270F0 @ case 51
	.4byte _080270C6 @ case 52
	.4byte _080270F0 @ case 53
	.4byte _080270C6 @ case 54
	.4byte _080270F0 @ case 55
	.4byte _080270F0 @ case 56
	.4byte _080270F0 @ case 57
	.4byte _080270F0 @ case 58
	.4byte _080270F0 @ case 59
	.4byte _080270F0 @ case 60
	.4byte _080270F0 @ case 61
	.4byte _080270F0 @ case 62
	.4byte _080270F0 @ case 63
	.4byte _080270F0 @ case 64
	.4byte _080270C6 @ case 65
	.4byte _080270F0 @ case 66
	.4byte _080270F0 @ case 67
	.4byte _080270F0 @ case 68
	.4byte _08027084 @ case 69
_08027084:
	ldr r0, _08027088 @ =0x00000743
	b _080270F2
	.align 2, 0
_08027088: .4byte 0x00000743
_0802708C:
	ldr r0, _08027090 @ =0x00000747
	b _080270F2
	.align 2, 0
_08027090: .4byte 0x00000747
_08027094:
	ldr r0, _08027098 @ =0x00000746
	b _080270F2
	.align 2, 0
_08027098: .4byte 0x00000746
_0802709C:
	ldr r0, _080270B8 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080270C0
	ldr r0, _080270BC @ =0x0000074A
	b _080270F2
	.align 2, 0
_080270B8: .4byte 0x03004690
_080270BC: .4byte 0x0000074A
_080270C0:
	movs r0, #0xe9
	lsls r0, r0, #3
	b _080270F2
_080270C6:
	ldr r4, _080270E8 @ =0x03004690
	ldr r1, [r4]
	movs r5, #8
	ldrsb r5, [r1, r5]
	movs r0, #0xa
	strb r0, [r1, #8]
	ldr r0, [r4]
	adds r1, r6, #0
	bl sub_08027400
	ldr r1, [r4]
	strb r5, [r1, #8]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080270F0
	ldr r0, _080270EC @ =0x00000745
	b _080270F2
	.align 2, 0
_080270E8: .4byte 0x03004690
_080270EC: .4byte 0x00000745
_080270F0:
	ldr r0, _080270F8 @ =0x00000744
_080270F2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080270F8: .4byte 0x00000744
