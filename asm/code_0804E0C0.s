	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804E0C0
sub_0804E0C0: @ 0x0804E0C0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0804E0EA
	movs r0, #1
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #1
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	adds r0, r4, #0
	bl Proc_Break
_0804E0EA:
	pop {r4}
	pop {r0}
	bx r0
