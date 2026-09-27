	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DB74
sub_0807DB74: @ 0x0807DB74
	push {lr}
	bl sub_0807A304
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DB98
	movs r1, #0
	ldr r0, _0807DB94 @ =0x0202E3E0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #5]
	cmp r0, #0x25
	bne _0807DB90
	movs r1, #1
_0807DB90:
	adds r0, r1, #0
	b _0807DB9A
	.align 2, 0
_0807DB94: .4byte 0x0202E3E0
_0807DB98:
	movs r0, #0
_0807DB9A:
	pop {r1}
	bx r1
	.align 2, 0
