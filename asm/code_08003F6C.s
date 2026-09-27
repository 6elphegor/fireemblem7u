	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08003F6C
sub_08003F6C: @ 0x08003F6C
	push {r7, lr}
	mov r7, sp
	movs r0, #7
	bl sub_08003F8C
	ldr r0, _08003F88 @ =0x02024E1C
	ldrb r1, [r0, #8]
	movs r2, #0xff
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #8]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003F88: .4byte 0x02024E1C
