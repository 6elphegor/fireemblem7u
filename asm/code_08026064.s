	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08026064
sub_08026064: @ 0x08026064
	push {lr}
	ldr r2, _080260A8 @ =0x0202E3DC
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080260AC
	ldr r0, [r2, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080260AC
	movs r0, #0xc0
	ldrb r1, [r2, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _080260AC
	adds r0, r2, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _080260AC
	cmp r1, #2
	beq _080260AC
	movs r0, #1
	b _080260AE
	.align 2, 0
_080260A8: .4byte 0x0202E3DC
_080260AC:
	movs r0, #0
_080260AE:
	pop {r1}
	bx r1
	.align 2, 0
