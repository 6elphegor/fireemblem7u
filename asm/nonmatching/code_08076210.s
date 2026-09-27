	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08076210
sub_08076210: @ 0x08076210
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076240 @ =0x0203E0FC
	ldr r2, _08076240 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076244 @ =0x083F51E8
	ldr r2, _08076248 @ =0x083F6314
	bl StartManimAntitoxinFx
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076240: .4byte 0x0203E0FC
_08076244: .4byte 0x083F51E8
_08076248: .4byte 0x083F6314
