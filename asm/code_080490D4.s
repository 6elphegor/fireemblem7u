	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080490D4
sub_080490D4: @ 0x080490D4
	push {r4, r5, lr}
	ldr r5, _08049118 @ =0x081C80E4
	ldr r0, _0804911C @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08049112
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _08049120 @ =0x02022860
	movs r4, #0xf
	adds r3, r0, #0
	adds r3, #0x42
_080490FA:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _080490FA
	bl EnablePalSync
_08049112:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049118: .4byte 0x081C80E4
_0804911C: .4byte 0x0203DCE8
_08049120: .4byte 0x02022860
