	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08003FC0
sub_08003FC0: @ 0x08003FC0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0x5a
	beq _08003FF0
	cmp r0, #0x5a
	bgt _08003FDC
	cmp r0, #0x2a
	bgt _08004008
	cmp r0, #0x29
	blt _08004008
	b _08003FF0
_08003FDC:
	cmp r0, #0x5f
	beq _08003FF0
	cmp r0, #0x5f
	bgt _08003FEA
	cmp r0, #0x5c
	beq _08003FF0
	b _08004008
_08003FEA:
	cmp r0, #0x74
	beq _08003FF0
	b _08004008
_08003FF0:
	ldr r0, _08004004 @ =0x02024E1C
	movs r1, #8
	ldrsb r1, [r0, r1]
	cmp r1, #8
	beq _08004000
	movs r0, #8
	bl sub_08003F8C
_08004000:
	b _08004020
	.align 2, 0
_08004004: .4byte 0x02024E1C
_08004008:
	ldr r0, _0800401C @ =0x02024E1C
	movs r1, #8
	ldrsb r1, [r0, r1]
	movs r0, #1
	cmn r1, r0
	beq _08004018
	bl sub_08003F6C
_08004018:
	b _08004020
	.align 2, 0
_0800401C: .4byte 0x02024E1C
_08004020:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
