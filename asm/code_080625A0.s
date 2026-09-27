	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080625A0
sub_080625A0: @ 0x080625A0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080625C0
	ldr r0, [r4, #0x5c]
	bl sub_080625D0
	ldr r0, [r4, #0x5c]
	bl sub_08062648
	b _080625CA
_080625C0:
	cmp r0, #0x11
	bne _080625CA
	adds r0, r4, #0
	bl Proc_Break
_080625CA:
	pop {r4}
	pop {r0}
	bx r0
