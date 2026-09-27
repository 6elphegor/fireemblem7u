	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807624C
sub_0807624C: @ 0x0807624C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807627C @ =0x0203E0FC
	ldr r2, _0807627C @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076280 @ =0x083F51E8
	ldr r2, _08076284 @ =0x083F62F4
	bl StartManimAntitoxinFx
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807627C: .4byte 0x0203E0FC
_08076280: .4byte 0x083F51E8
_08076284: .4byte 0x083F62F4
