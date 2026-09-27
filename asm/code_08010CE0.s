	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010CE0
sub_08010CE0: @ 0x08010CE0
	push {r4, r5, lr}
	adds r4, r0, #0
	bl LockBmDisplay
	bl LockMus
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08010D40 @ =0x06001000
	ldr r1, _08010D44 @ =0x06008000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _08010D48 @ =0x02022860
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r0, r2
	ldr r2, [r4, #0x44]
	lsls r2, r2, #3
	ldr r3, _08010D4C @ =0x001FFFFF
	ands r2, r3
	bl CpuFastSet
	movs r5, #0xff
	lsls r5, r5, #7
	adds r4, r5, #0
	ldr r3, _08010D50 @ =0x02023C60
	ldr r2, _08010D54 @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #3
_08010D24:
	ldrh r5, [r3]
	adds r0, r4, r5
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _08010D24
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010D40: .4byte 0x06001000
_08010D44: .4byte 0x06008000
_08010D48: .4byte 0x02022860
_08010D4C: .4byte 0x001FFFFF
_08010D50: .4byte 0x02023C60
_08010D54: .4byte 0x02024460
