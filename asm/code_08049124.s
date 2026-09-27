	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08049124
sub_08049124: @ 0x08049124
	push {r4, r5, r6, lr}
	ldr r5, _08049168 @ =0x081C80E4
	ldr r0, _0804916C @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08049162
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _08049170 @ =0x02022860
	movs r4, #0xf
	ldr r6, _08049174 @ =0x00000262
	adds r3, r0, r6
_0804914A:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _0804914A
	bl EnablePalSync
_08049162:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08049168: .4byte 0x081C80E4
_0804916C: .4byte 0x0203DCE8
_08049170: .4byte 0x02022860
_08049174: .4byte 0x00000262
