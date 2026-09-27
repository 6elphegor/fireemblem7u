	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemRangeString
GetItemRangeString: @ 0x080168AC
	push {r4, r5, lr}
	sub sp, #0x28
	mov r2, sp
	ldr r1, _080168EC @ =0x081C3AF0
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r1, [r1]
	str r1, [r2]
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080168F0 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	adds r1, r0, #0
	cmp r0, #0x22
	beq _08016926
	cmp r0, #0x22
	bgt _080168FE
	cmp r0, #0x11
	beq _0801691A
	cmp r0, #0x11
	bgt _080168F4
	cmp r0, #0x10
	beq _08016916
	b _0801693A
	.align 2, 0
_080168EC: .4byte 0x081C3AF0
_080168F0: .4byte 0x08BE222C
_080168F4:
	cmp r0, #0x12
	beq _0801691E
	cmp r0, #0x13
	beq _08016922
	b _0801693A
_080168FE:
	cmp r0, #0x3a
	beq _0801692E
	cmp r0, #0x3a
	bgt _0801690C
	cmp r0, #0x23
	beq _0801692A
	b _0801693A
_0801690C:
	cmp r1, #0x3f
	beq _08016932
	cmp r1, #0xff
	beq _08016936
	b _0801693A
_08016916:
	ldr r0, [sp]
	b _0801693C
_0801691A:
	ldr r0, [sp, #4]
	b _0801693C
_0801691E:
	ldr r0, [sp, #8]
	b _0801693C
_08016922:
	ldr r0, [sp, #0xc]
	b _0801693C
_08016926:
	ldr r0, [sp, #0x10]
	b _0801693C
_0801692A:
	ldr r0, [sp, #0x14]
	b _0801693C
_0801692E:
	ldr r0, [sp, #0x18]
	b _0801693C
_08016932:
	ldr r0, [sp, #0x1c]
	b _0801693C
_08016936:
	ldr r0, [sp, #0x20]
	b _0801693C
_0801693A:
	ldr r0, [sp, #0x24]
_0801693C:
	bl DecodeMsg
	add sp, #0x28
	pop {r4, r5}
	pop {r1}
	bx r1
