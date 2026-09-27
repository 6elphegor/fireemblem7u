	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A2F38
sub_080A2F38: @ 0x080A2F38
	push {lr}
	sub sp, #0x10
	ldr r1, _080A2F6C @ =0x0840F953
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	bl GetGameTime
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	add r0, sp
	ldr r1, _080A2F70 @ =0x0200050C
	ldrb r0, [r0]
	lsls r2, r0, #5
	ldr r0, [r1]
	adds r0, r0, r2
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080A2F6C: .4byte 0x0840F953
_080A2F70: .4byte 0x0200050C
