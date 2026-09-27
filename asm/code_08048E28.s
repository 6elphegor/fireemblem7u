	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08048E28
sub_08048E28: @ 0x08048E28
	push {r4, r5, r6, lr}
	ldr r5, _08048E6C @ =0x081C80E4
	ldr r0, _08048E70 @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08048E66
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _08048E74 @ =0x02022860
	movs r4, #0xf
	ldr r6, _08048E78 @ =0x00000322
	adds r3, r0, r6
_08048E4E:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _08048E4E
	bl EnablePalSync
_08048E66:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08048E6C: .4byte 0x081C80E4
_08048E70: .4byte 0x0203DCE8
_08048E74: .4byte 0x02022860
_08048E78: .4byte 0x00000322
