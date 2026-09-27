	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BAA90
sub_080BAA90: @ 0x080BAA90
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_08002C8C
	ldr r0, _080BAAD0 @ =0x08672570
	movs r1, #0xbc
	lsls r1, r1, #1
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #4
	str r2, [sp]
	movs r2, #0xa
	str r2, [sp, #4]
	movs r2, #0x80
	bl StartSpriteAnimProc
	str r0, [r4, #0x3c]
	movs r1, #0x80
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0x78
	movs r2, #0x80
	movs r3, #0x78
	bl TitleSpriteBlendIN
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BAAD0: .4byte 0x08672570
