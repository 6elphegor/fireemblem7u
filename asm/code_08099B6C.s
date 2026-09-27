	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099B6C
sub_08099B6C: @ 0x08099B6C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r2, #0
	adds r6, r3, #0
	ldr r2, [sp, #0x14]
	cmp r2, #0
	ble _08099B98
	lsls r0, r1, #5
	adds r0, r4, r0
	ldr r1, _08099BA0 @ =0x02023C60
	adds r5, r2, #0
	lsls r0, r0, #1
	adds r4, r0, r1
_08099B86:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSpecialChar
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08099B86
_08099B98:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099BA0: .4byte 0x02023C60
