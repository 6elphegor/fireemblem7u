	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugInitBg
DebugInitBg: @ 0x08004EF8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r6, #0
	bne _08004F06
	movs r6, #0xb0
	lsls r6, r6, #7
_08004F06:
	adds r0, r5, #0
	movs r1, #0
	bl SetBgChrOffset
	adds r0, r5, #0
	movs r1, #0
	bl SetBgScreenSize
	ldr r0, _08004F5C @ =0x08B8590C
	ldr r1, _08004F60 @ =0x0001FFFF
	ands r1, r6
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	ldr r1, _08004F64 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08004F68 @ =0x00007FFF
	strh r0, [r1, #4]
	bl EnablePalSync
	adds r0, r5, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r4, _08004F6C @ =0x02026D30
	strh r5, [r4, #4]
	str r6, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetBgChrId
	strh r0, [r4, #6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004F5C: .4byte 0x08B8590C
_08004F60: .4byte 0x0001FFFF
_08004F64: .4byte 0x02022860
_08004F68: .4byte 0x00007FFF
_08004F6C: .4byte 0x02026D30
