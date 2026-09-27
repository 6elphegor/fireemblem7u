	.include "macro.inc"

	.syntax unified

	thumb_func_start GetWeaponLevelStringFromExp
GetWeaponLevelStringFromExp: @ 0x0801697C
	push {r4, r5, lr}
	sub sp, #0x20
	mov r2, sp
	ldr r1, _080169B8 @ =0x081C3B18
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080169BC @ =0x08BE222C
	adds r1, r1, r0
	ldrb r4, [r1, #0x1c]
	ldr r0, [r1, #8]
	ldr r1, _080169C0 @ =0x003D3C00
	ands r0, r1
	cmp r0, #0
	beq _080169C4
	adds r0, r4, #0
	bl GetWeaponLevelFromExp
	cmp r0, #0
	bne _080169C4
	movs r4, #7
	b _080169CC
	.align 2, 0
_080169B8: .4byte 0x081C3B18
_080169BC: .4byte 0x08BE222C
_080169C0: .4byte 0x003D3C00
_080169C4:
	adds r0, r4, #0
	bl GetWeaponLevelFromExp
	adds r4, r0, #0
_080169CC:
	lsls r0, r4, #2
	add r0, sp
	ldr r0, [r0]
	bl DecodeMsg
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
