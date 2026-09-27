	.include "macro.inc"

	.syntax unified

	thumb_func_start SetupDebugFontForOBJ
SetupDebugFontForOBJ: @ 0x08005280
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	bge _0800528E
	movs r2, #0xc0
	lsls r2, r2, #6
_0800528E:
	ldr r0, _080052F0 @ =0x0000FFFF
	ands r2, r0
	ldr r1, _080052F4 @ =0x02028D50
	adds r0, r2, #0
	asrs r0, r0, #5
	str r0, [r1]
	ldr r1, _080052F8 @ =0x02028D54
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	str r0, [r1]
	ldr r0, _080052FC @ =0x08B8590C
	movs r3, #0x80
	lsls r3, r3, #9
	adds r1, r2, r3
	ldr r2, _08005300 @ =0x0001FFFF
	ands r1, r2
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	ldr r3, _08005304 @ =0x02022860
	adds r1, r4, #0
	adds r1, #0x10
	lsls r0, r1, #5
	adds r0, r0, r3
	movs r2, #0
	strh r2, [r0]
	lsls r1, r1, #4
	adds r0, r1, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0xf8
	lsls r2, r2, #7
	strh r2, [r0]
	adds r1, #2
	lsls r1, r1, #1
	adds r1, r1, r3
	ldr r0, _08005308 @ =0x00007FFF
	strh r0, [r1]
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080052F0: .4byte 0x0000FFFF
_080052F4: .4byte 0x02028D50
_080052F8: .4byte 0x02028D54
_080052FC: .4byte 0x08B8590C
_08005300: .4byte 0x0001FFFF
_08005304: .4byte 0x02022860
_08005308: .4byte 0x00007FFF
